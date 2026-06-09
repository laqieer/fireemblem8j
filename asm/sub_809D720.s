	.syntax unified
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set sub_80943D4, 0x080943D4 + 1
	.set sub_80976A0, 0x080976A0 + 1
	.section .text.sub_809D720, "ax", %progbits
@ sub_809D720 @ JP 0x0809D720 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809D720
	.thumb_func
sub_809D720:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	bl GetUnitFromPrepList
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_80976A0
	adds r0, r4, #0
	bl sub_80943D4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

