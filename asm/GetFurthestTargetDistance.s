	.syntax unified
	.section .text.GetFurthestTargetDistance, "ax", %progbits
@ GetFurthestTargetDistance @ JP 0x08050970 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetFurthestTargetDistance
	.thumb_func
GetFurthestTargetDistance:
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	ldr r5, _080509A8 @ =0x0203DDE8
	ldr r0, _080509AC @ =0x0203E0E8
	ldr r0, [r0]
	cmp r7, r0
	bge _080509C6
	ldr r1, _080509B0 @ =0x0203DDE4
	mov ip, r1
	movs r2, #0
	ldrsh r6, [r1, r2]
	adds r4, r0, #0
_08050988:
	movs r0, #0
	ldrsb r0, [r5, r0]
	subs r2, r6, r0
	cmp r2, #0
	bge _08050994
	subs r2, r0, r6
_08050994:
	mov r0, ip
	movs r1, #2
	ldrsh r3, [r0, r1]
	movs r0, #1
	ldrsb r0, [r5, r0]
	subs r1, r3, r0
	cmp r1, #0
	blt _080509B4
	adds r0, r2, r1
	b _080509B8
	.align 2, 0
_080509A8: .4byte 0x0203DDE8
_080509AC: .4byte 0x0203E0E8
_080509B0: .4byte 0x0203DDE4
_080509B4:
	subs r0, r0, r3
	adds r0, r2, r0
_080509B8:
	cmp r7, r0
	bge _080509BE
	adds r7, r0, #0
_080509BE:
	subs r4, #1
	adds r5, #0xc
	cmp r4, #0
	bne _08050988
_080509C6:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

