	.syntax unified
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_8085C34, "ax", %progbits
@ sub_8085C34 @ JP 0x08085C34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8085C34
	.thumb_func
sub_8085C34:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r5, [r4]
	ldrb r6, [r5, #8]
	ldrb r7, [r5, #9]
	ldr r1, [r5, #0xc]
	bl sub_80D65C0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08085C66
	ldrb r0, [r4, #0x1a]
	cmp r0, r6
	beq _08085C54
	cmp r6, #0
	bne _08085C66
_08085C54:
	ldrb r0, [r4, #0x1b]
	cmp r0, r7
	bne _08085C66
	ldr r0, [r5, #4]
	str r0, [r4, #4]
	ldrh r0, [r5, #2]
	str r0, [r4, #8]
	movs r0, #1
	b _08085C68
_08085C66:
	movs r0, #0
_08085C68:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

