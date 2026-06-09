	.syntax unified
	.set CheckFlag, 0x080860D0 + 1
	.section .text.sub_8085B6C, "ax", %progbits
@ sub_8085B6C @ JP 0x08085B6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8085B6C
	.thumb_func
sub_8085B6C:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _08085B88
	cmp r0, #0x64
	beq _08085B88
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08085B94
_08085B88:
	ldr r0, [r4, #4]
	str r0, [r5, #4]
	ldrh r0, [r4, #2]
	str r0, [r5, #8]
	movs r0, #1
	b _08085B96
_08085B94:
	movs r0, #0
_08085B96:
	pop {r4, r5}
	pop {r1}
	bx r1

