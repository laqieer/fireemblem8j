	.syntax unified
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set sub_80976A0, 0x080976A0 + 1
	.set sub_8097D18, 0x08097D18 + 1
	.section .text.sub_809D6D4, "ax", %progbits
@ sub_809D6D4 @ JP 0x0809D6D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809D6D4
	.thumb_func
sub_809D6D4:
	push {lr}
	ldr r2, [r0, #0x14]
	ldrh r1, [r0, #0x30]
	strh r1, [r2, #0x3c]
	ldr r1, [r0, #0x14]
	adds r2, r0, #0
	adds r2, #0x29
	ldrb r2, [r2]
	adds r1, #0x2b
	strb r2, [r1]
	ldrh r0, [r0, #0x2e]
	bl GetUnitFromPrepList
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_80976A0
	bl sub_8097D18
	pop {r0}
	bx r0
	.align 2, 0

