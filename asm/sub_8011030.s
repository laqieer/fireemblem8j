	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8073820, 0x08073820 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8011030, "ax", %progbits
@ sub_8011030 @ JP 0x08011030 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8011030
	.thumb_func
sub_8011030:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_8012E84
	adds r5, r0, #0
	ldr r0, _08011074 @ =0x085D1DF0
	ldr r4, _08011078 @ =0x02022AE8
	adds r1, r4, #0
	movs r2, #8
	bl sub_80D636C
	ldr r0, _0801107C @ =0xFFFFFDC0
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x12
	movs r2, #1
	adds r3, r5, #0
	bl sub_8073820
	bl sub_8001EE4
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011074: .4byte 0x085D1DF0
_08011078: .4byte 0x02022AE8
_0801107C: .4byte 0xFFFFFDC0

