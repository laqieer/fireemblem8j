	.syntax unified
	.set RegisterDataMove, 0x08001F64 + 1
	.set __umodsi3, 0x080D6848 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.section .text.sub_8026F38, "ax", %progbits
@ sub_8026F38 @ JP 0x08026F38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8026F38
	.thumb_func
sub_8026F38:
	push {lr}
	ldr r0, _08026F58 @ =0x0203A4C8
	movs r1, #0
	str r1, [r0]
	bl sub_8000CD8
	movs r1, #0x48
	bl __umodsi3
	adds r1, r0, #0
	cmp r0, #0x43
	bgt _08026F64
	cmp r0, #0x23
	ble _08026F60
	ldr r0, _08026F5C @ =0x0203800C
	b _08026F66
	.align 2, 0
_08026F58: .4byte 0x0203A4C8
_08026F5C: .4byte 0x0203800C
_08026F60:
	cmp r0, #0x1f
	ble _08026F7C
_08026F64:
	ldr r0, _08026F74 @ =0x0203600C
_08026F66:
	ldr r1, _08026F78 @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #6
	bl RegisterDataMove
	b _08026F8C
	.align 2, 0
_08026F74: .4byte 0x0203600C
_08026F78: .4byte 0x06011000
_08026F7C:
	cmp r1, #0
	blt _08026F8C
	ldr r0, _08026F90 @ =0x0203400C
	ldr r1, _08026F94 @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #6
	bl RegisterDataMove
_08026F8C:
	pop {r0}
	bx r0
	.align 2, 0
_08026F90: .4byte 0x0203400C
_08026F94: .4byte 0x06011000

