	.syntax unified
	.set RegisterDataMove, 0x08001F64 + 1
	.set __umodsi3, 0x080D6848 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.section .text.sub_8027080, "ax", %progbits
@ sub_8027080 @ JP 0x08027080 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8027080
	.thumb_func
sub_8027080:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	bl sub_8000CD8
	movs r1, #0x48
	bl __umodsi3
	adds r1, r0, #0
	movs r5, #0
	cmp r0, #0x43
	bgt _080270A8
	cmp r0, #0x23
	ble _080270A4
	ldr r5, _080270A0 @ =0x0203800C
	b _080270B6
	.align 2, 0
_080270A0: .4byte 0x0203800C
_080270A4:
	cmp r0, #0x1f
	ble _080270B0
_080270A8:
	ldr r5, _080270AC @ =0x0203600C
	b _080270B6
	.align 2, 0
_080270AC: .4byte 0x0203600C
_080270B0:
	cmp r1, #0
	blt _080270B6
	ldr r5, _080270DC @ =0x0203400C
_080270B6:
	cmp r5, #0
	beq _080270D4
	lsls r4, r4, #5
	movs r6, #3
_080270BE:
	adds r0, r5, r4
	adds r1, r7, r4
	movs r2, #0x80
	bl RegisterDataMove
	movs r0, #0x80
	lsls r0, r0, #3
	adds r4, r4, r0
	subs r6, #1
	cmp r6, #0
	bge _080270BE
_080270D4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080270DC: .4byte 0x0203400C

