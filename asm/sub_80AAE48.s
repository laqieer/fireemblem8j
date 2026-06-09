	.syntax unified
	.set SramOffsetToAddr, 0x080A7918 + 1
	.set sub_80AAE20, 0x080AAE20 + 1
	.section .text.sub_80AAE48, "ax", %progbits
@ sub_80AAE48 @ JP 0x080AAE48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AAE48
	.thumb_func
sub_80AAE48:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r5, [r4, #0xa]
	ldrh r0, [r4, #8]
	bl SramOffsetToAddr
	adds r1, r5, #0
	bl sub_80AAE20
	ldr r1, [r4, #0xc]
	cmp r1, r0
	bne _080AAE64
	movs r0, #1
	b _080AAE66
_080AAE64:
	movs r0, #0
_080AAE66:
	pop {r4, r5}
	pop {r1}
	bx r1

