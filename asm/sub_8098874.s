	.syntax unified
	.set ChangeBgm, 0x08002938 + 1
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.section .text.sub_8098874, "ax", %progbits
@ sub_8098874 @ JP 0x08098874 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8098874
	.thumb_func
sub_8098874:
	push {r4, lr}
	sub sp, #4
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	bl GetUnitFromCharId
	adds r1, r0, #0
	cmp r1, #0
	beq _0809888C
	movs r0, #0xff
	strb r0, [r1, #9]
_0809888C:
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetBlendConfig
	ldr r2, _080988D0 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	str r0, [sp]
	movs r0, #0x34
	adds r1, r4, #0
	adds r2, r4, #0
	movs r3, #0x20
	bl ChangeBgm
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080988D0: .4byte 0x03003020

