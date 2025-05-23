import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quest_task/core/utils/theme/app_colors.dart';
import 'package:quest_task/core/utils/widgets/custom_snackbar.dart';
import 'package:quest_task/features/appointment/presentation/manager/cubit/appointment_cubit.dart';
import 'package:quest_task/features/appointment/presentation/manager/cubit/appointment_state.dart';
import 'package:quest_task/features/appointment/presentation/views/widgets/appointment_card.dart';
import 'package:quest_task/features/appointment/presentation/views/widgets/appointment_loading_view.dart';
import 'package:quest_task/features/appointment/presentation/views/widgets/empty_appointments.dart';
import 'package:quest_task/features/home/presentation/manager/cubit/home_cubit.dart';

class AppointmentsView extends StatefulWidget {
  const AppointmentsView({super.key});

  @override
  State<AppointmentsView> createState() => _AppointmentsViewState();
}

class _AppointmentsViewState extends State<AppointmentsView>
    with AutomaticKeepAliveClientMixin {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchAppointments();
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      _fetchAppointments();
    }
  }

  void _fetchAppointments() {
    if (!mounted) return;
    context.read<AppointmentCubit>().fetchUserAppointments();
  }

  Future<void> _showCancelDialog(
    BuildContext context,
    String appointmentId,
  ) async {
    final result = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Cancel Appointment'),
            content: const Text(
              'Are you sure you want to cancel this appointment?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: const Text('Yes, Cancel'),
              ),
            ],
          ),
    );

    if (result == true) {
      if (!mounted) return;
      context.read<AppointmentCubit>().cancelAppointment(appointmentId);
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Focus(
      focusNode: _focusNode,
      child: Scaffold(
        backgroundColor: AppColors.surfaceVariant,
        appBar: AppBar(
          title: const Text('My Appointments'),
          backgroundColor: AppColors.surface,
          foregroundColor: AppColors.onSurface,
        ),
        body: BlocConsumer<AppointmentCubit, AppointmentState>(
          listener: (context, state) {
            if (state is FetchUserAppointmentsFiled) {
              CustomSnackBar.show(
                context: context,
                message: state.error,
                type: SnackBarType.error,
              );
            } else if (state is CancelingAppointmentError) {
              CustomSnackBar.show(
                context: context,
                message: state.message,
                type: SnackBarType.error,
              );
            } else if (state is CancelingAppointmentSuccess) {
              CustomSnackBar.show(
                context: context,
                message: 'Appointment cancelled successfully',
                type: SnackBarType.success,
              );
              context.read<HomeCubit>().getAllSpecialists();
            }
          },
          builder: (context, state) {
            if (state is FetchUserAppointmentsLoading ||
                state is CancelingAppointmentLoading) {
              return const AppointmentLoadingView();
            }

            if (state is FetchUserAppointmentsSuccess) {
              if (state.appointments.isEmpty) {
                return const EmptyAppointments();
              }
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.appointments.length,
                itemBuilder: (context, index) {
                  final appointment = state.appointments[index];
                  return AppointmentCard(
                    appointment: appointment,
                    onCancel: () => _showCancelDialog(context, appointment.id!),
                  );
                },
              );
            }

            return const EmptyAppointments();
          },
        ),
      ),
    );
  }
}
