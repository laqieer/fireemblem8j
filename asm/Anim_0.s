	.syntax unified
	.section .text.Anim_0, "ax", %progbits
@ Anim_0 @ JP 0x0800523C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Anim_0
	.thumb_func
Anim_0:
	push {lr}
	adds r2, r0, #0
	movs r0, #0xff
	ands r1, r0
	cmp r1, #0x18
	beq _0800526C
	cmp r1, #0x18
	bhi _0800525A
	cmp r1, #1
	blo _08005272
	cmp r1, #5
	bls _0800526C
	cmp r1, #0x13
	beq _0800526C
	b _08005272
_0800525A:
	cmp r1, #0x39
	beq _0800526C
	cmp r1, #0x39
	bhi _08005268
	cmp r1, #0x2d
	beq _0800526C
	b _08005272
_08005268:
	cmp r1, #0x52
	bne _08005272
_0800526C:
	ldr r0, [r2, #0x20]
	subs r0, #4
	str r0, [r2, #0x20]
_08005272:
	pop {r0}
	bx r0
	.align 2, 0

