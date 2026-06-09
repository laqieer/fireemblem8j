	.syntax unified
	.set GetTrueTerrainAt, 0x080197CC + 1
	.set RemoveTrap, 0x0802E234 + 1
	.section .text.sub_802E9C8, "ax", %progbits
@ sub_802E9C8 @ JP 0x0802E9C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802E9C8
	.thumb_func
sub_802E9C8:
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl GetTrueTerrainAt
	ldrb r1, [r4, #1]
	ldr r2, _0802E9F4 @ =0x0202E4D8
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r2, [r4]
	ldr r1, [r1]
	adds r1, r1, r2
	strb r0, [r1]
	adds r0, r4, #0
	bl RemoveTrap
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0802E9F4: .4byte 0x0202E4D8

