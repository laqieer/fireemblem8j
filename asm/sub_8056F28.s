	.syntax unified
	.set GetBanimDragonStatusType, 0x08072060 + 1
	.set Proc_End, 0x08002CBC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8050B48, 0x08050B48 + 1
	.section .text.sub_8056F28, "ax", %progbits
@ sub_8056F28 @ JP 0x08056F28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8056F28
	.thumb_func
sub_8056F28:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	ble _08056F68
	ldr r0, _08056F58 @ =0x0203E0FA
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08056F4C
	bl GetBanimDragonStatusType
	cmp r0, #0
	beq _08056F5C
_08056F4C:
	bl sub_8050B48
	adds r0, r4, #0
	bl Proc_End
	b _08056F68
	.align 2, 0
_08056F58: .4byte 0x0203E0FA
_08056F5C:
	strh r0, [r4, #0x2c]
	bl sub_8050B48
	adds r0, r4, #0
	bl sub_8002DE4
_08056F68:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

