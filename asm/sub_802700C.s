	.syntax unified
	.set RegisterDataMove, 0x08001F64 + 1
	.set __umodsi3, 0x080D6848 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.section .text.sub_802700C, "ax", %progbits
@ sub_802700C @ JP 0x0802700C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802700C
	.thumb_func
sub_802700C:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_8000CD8
	movs r1, #0x48
	bl __umodsi3
	adds r1, r0, #0
	movs r2, #0
	cmp r0, #0x43
	bgt _08027034
	cmp r0, #0x23
	ble _08027030
	ldr r2, _0802702C @ =0x0203800C
	b _08027042
	.align 2, 0
_0802702C: .4byte 0x0203800C
_08027030:
	cmp r0, #0x1f
	ble _0802703C
_08027034:
	ldr r2, _08027038 @ =0x0203600C
	b _08027042
	.align 2, 0
_08027038: .4byte 0x0203600C
_0802703C:
	cmp r1, #0
	blt _08027042
	ldr r2, _08027078 @ =0x0203400C
_08027042:
	cmp r2, #0
	beq _08027072
	ldr r1, _0802707C @ =0x085C3B4C
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #5
	adds r1, r5, #0
	adds r1, #0x20
	adds r5, r0, r1
	adds r4, r0, r2
	movs r6, #3
_0802705A:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x40
	bl RegisterDataMove
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	adds r4, r4, r0
	subs r6, #1
	cmp r6, #0
	bge _0802705A
_08027072:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08027078: .4byte 0x0203400C
_0802707C: .4byte 0x085C3B4C

