	.syntax unified
	.set GetClassData, 0x0801911C + 1
	.set sub_807AAB8, 0x0807AAB8 + 1
	.section .text.sub_807AAE0, "ax", %progbits
@ sub_807AAE0 @ JP 0x0807AAE0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807AAE0
	.thumb_func
sub_807AAE0:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x41
	ldrb r0, [r0]
	bl GetClassData
	ldr r0, [r0, #0x28]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0807AAFE
	adds r0, r4, #0
	bl sub_807AAB8
	b _0807AB06
_0807AAFE:
	adds r0, r4, #0
	movs r1, #2
	bl sub_807AAB8
_0807AB06:
	pop {r4}
	pop {r0}
	bx r0

