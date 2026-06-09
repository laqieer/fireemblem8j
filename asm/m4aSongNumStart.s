	.syntax unified
	.set MPlayStart, 0x080D5628 + 1
	.section .text.m4aSongNumStart, "ax", %progbits
@ m4aSongNumStart @ JP 0x080D4EF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global m4aSongNumStart
	.thumb_func
m4aSongNumStart:
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _080D4F18 @ =0x082140B4
	ldr r1, _080D4F1C @ =0x08214120
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r1, [r0]
	adds r0, r2, #0
	bl MPlayStart
	pop {r0}
	bx r0
	.align 2, 0
_080D4F18: .4byte 0x082140B4
_080D4F1C: .4byte 0x08214120

