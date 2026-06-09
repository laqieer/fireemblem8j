	.syntax unified
	.set CheckFlag, 0x080860D0 + 1
	.section .text.sub_8085BE4, "ax", %progbits
@ sub_8085BE4 @ JP 0x08085BE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8085BE4
	.thumb_func
sub_8085BE4:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, [r5]
	ldrb r6, [r4, #8]
	ldrb r7, [r4, #9]
	ldrh r0, [r4, #0xc]
	cmp r0, #2
	beq _08085C2A
	cmp r0, #2
	bgt _08085BFE
	cmp r0, #1
	beq _08085C2A
	b _08085C0E
_08085BFE:
	cmp r0, #3
	bne _08085C0E
	ldrh r0, [r4, #0xe]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08085C2A
_08085C0E:
	ldrb r0, [r5, #0x1a]
	cmp r0, r6
	beq _08085C18
	cmp r6, #0
	bne _08085C2A
_08085C18:
	ldrb r0, [r5, #0x1b]
	cmp r0, r7
	bne _08085C2A
	ldr r0, [r4, #4]
	str r0, [r5, #4]
	ldrh r0, [r4, #2]
	str r0, [r5, #8]
	movs r0, #1
	b _08085C2C
_08085C2A:
	movs r0, #0
_08085C2C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

