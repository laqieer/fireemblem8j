	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_807290C, 0x0807290C + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8055570, "ax", %progbits
@ sub_8055570 @ JP 0x08055570 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8055570
	.thumb_func
sub_8055570:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0805559C
	ldr r0, _08055594 @ =0x02000054
	ldr r0, [r0]
	ldr r1, _08055598 @ =0x02022B88
	movs r2, #8
	bl sub_80D636C
	ldr r0, [r4, #0x5c]
	bl sub_807290C
	b _080555AE
	.align 2, 0
_08055594: .4byte 0x02000054
_08055598: .4byte 0x02022B88
_0805559C:
	ldr r0, _080555C0 @ =0x02000054
	ldr r0, [r0, #4]
	ldr r1, _080555C4 @ =0x02022BC8
	movs r2, #8
	bl sub_80D636C
	ldr r0, [r4, #0x5c]
	bl sub_807290C
_080555AE:
	bl sub_8001EE4
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080555C0: .4byte 0x02000054
_080555C4: .4byte 0x02022BC8

