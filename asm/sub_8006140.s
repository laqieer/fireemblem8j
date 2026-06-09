	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8006374, 0x08006374 + 1
	.section .text.sub_8006140, "ax", %progbits
@ sub_8006140 @ JP 0x08006140 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006140
	.thumb_func
sub_8006140:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	str r0, [r5, #0x2c]
	ldr r0, [r0, #0x2c]
	ldrb r0, [r0, #0x18]
	movs r4, #0
	strh r0, [r5, #0x30]
	adds r0, r5, #0
	bl sub_8006374
	str r0, [r5, #0x38]
	strh r4, [r5, #0x32]
	movs r0, #0x30
	ldrsh r1, [r5, r0]
	cmp r1, #6
	bne _08006178
	movs r0, #5
	strh r0, [r5, #0x30]
	ldr r0, _08006180 @ =0x7FFFFFFF
	str r0, [r5, #0x38]
	movs r0, #2
	strh r0, [r5, #0x32]
	strh r1, [r5, #0x34]
	adds r0, r5, #0
	movs r1, #0x61
	bl Proc_Goto
_08006178:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08006180: .4byte 0x7FFFFFFF

