	.syntax unified
	.set MaybeResetSomePal, 0x0800169C + 1
	.set MaybeSmoothChangeSomePal, 0x080016B8 + 1
	.section .text.sub_8020738, "ax", %progbits
@ sub_8020738 @ JP 0x08020738 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8020738
	.thumb_func
sub_8020738:
	push {r4, r5, lr}
	adds r0, #0x4c
	movs r1, #0x1e
	strh r1, [r0]
	bl MaybeResetSomePal
	ldr r4, _08020780 @ =0x02022928
	movs r5, #1
	rsbs r5, r5, #0
	adds r0, r4, #0
	movs r1, #4
	movs r2, #2
	adds r3, r5, #0
	bl MaybeSmoothChangeSomePal
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #0xe
	movs r2, #2
	adds r3, r5, #0
	bl MaybeSmoothChangeSomePal
	movs r0, #0xe0
	lsls r0, r0, #1
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x12
	movs r2, #1
	adds r3, r5, #0
	bl MaybeSmoothChangeSomePal
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08020780: .4byte 0x02022928

