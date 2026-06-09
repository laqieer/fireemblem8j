	.syntax unified
	.section .text.sub_80BFDD4, "ax", %progbits
@ sub_80BFDD4 @ JP 0x080BFDD4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BFDD4
	.thumb_func
sub_80BFDD4:
	push {lr}
	lsls r2, r2, #0x18
	lsls r1, r1, #2
	adds r0, #0x34
	adds r0, r0, r1
	ldr r3, [r0]
	cmp r2, #0
	beq _080BFDEC
	ldrh r1, [r3, #0x2a]
	movs r0, #1
	orrs r0, r1
	b _080BFDF2
_080BFDEC:
	ldrh r1, [r3, #0x2a]
	ldr r0, _080BFDF8 @ =0x0000FFFE
	ands r0, r1
_080BFDF2:
	strh r0, [r3, #0x2a]
	pop {r0}
	bx r0
	.align 2, 0
_080BFDF8: .4byte 0x0000FFFE

