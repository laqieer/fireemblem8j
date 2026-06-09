	.syntax unified
	.set CanPrepScreenCheckMap, 0x080977E4 + 1
	.set CheckInLinkArena, 0x08042E1C + 1
	.set PrepSpriteDraw_BlinkButtonB, 0x08098EC4 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_8097570, "ax", %progbits
@ sub_8097570 @ JP 0x08097570 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8097570
	.thumb_func
sub_8097570:
	push {r4, lr}
	adds r4, r0, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809758C
	bl CanPrepScreenCheckMap
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097598
	bl PrepSpriteDraw_BlinkButtonB
_0809758C:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	movs r0, #1
	b _0809759A
_08097598:
	movs r0, #0
_0809759A:
	pop {r4}
	pop {r1}
	bx r1

