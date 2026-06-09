	.syntax unified
	.set m4aMPlayStop, 0x080D570C + 1
	.section .text.m4aSongNumStop, "ax", %progbits
@ m4aSongNumStop @ JP 0x080D4FC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global m4aSongNumStop
	.thumb_func
m4aSongNumStop:
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _080D4FEC @ =0x082140B4
	ldr r1, _080D4FF0 @ =0x08214120
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r1, [r2]
	ldr r0, [r0]
	cmp r1, r0
	bne _080D4FE6
	adds r0, r2, #0
	bl m4aMPlayStop
_080D4FE6:
	pop {r0}
	bx r0
	.align 2, 0
_080D4FEC: .4byte 0x082140B4
_080D4FF0: .4byte 0x08214120

