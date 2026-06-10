	.syntax unified
	.set sub_8015E18, 0x08015E18 + 1
	.set sub_802E42C, 0x0802E42C + 1
	.section .text.sub_801F4B8, "ax", %progbits
@ sub_801F4B8 @ JP 0x0801F4B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801F4B8
	.thumb_func
sub_801F4B8:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	bl sub_802E42C
	ldrb r4, [r0, #3]
	lsrs r4, r4, #1
	ldrb r1, [r0, #1]
	adds r4, r4, r1
	ldrb r2, [r0, #4]
	lsrs r2, r2, #1
	ldrb r0, [r0, #2]
	adds r2, r2, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8015E18
	str r4, [r5, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

