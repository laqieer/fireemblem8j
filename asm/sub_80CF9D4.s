	.syntax unified
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_80CF9D4, "ax", %progbits
@ sub_80CF9D4 @ JP 0x080CF9D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CF9D4
	.thumb_func
sub_80CF9D4:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, r1, #0
	subs r2, r3, r2
	movs r5, #0x10
	subs r3, r5, r2
	cmp r3, #0
	bge _080CF9F0
	ldr r0, _080CF9EC @ =0x0000FFFF
	b _080CFA0A
	.align 2, 0
_080CF9EC: .4byte 0x0000FFFF
_080CF9F0:
	cmp r3, #0xf
	bgt _080CFA08
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #4
	adds r1, r4, r1
	str r5, [sp]
	movs r0, #4
	adds r2, r4, #0
	bl sub_8012E84
	b _080CFA0A
_080CFA08:
	adds r0, r4, #0
_080CFA0A:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

