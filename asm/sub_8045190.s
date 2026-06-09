	.syntax unified
	.set CheckInLinkArena, 0x08042E1C + 1
	.set nullsub_2, 0x0804D148 + 1
	.set sub_8089078, 0x08089078 + 1
	.section .text.sub_8045190, "ax", %progbits
@ sub_8045190 @ JP 0x08045190 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8045190
	.thumb_func
sub_8045190:
	push {lr}
	bl sub_8089078
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080451A4
	bl nullsub_2
_080451A4:
	pop {r0}
	bx r0

