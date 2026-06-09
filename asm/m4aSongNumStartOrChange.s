	.syntax unified
	.set MPlayStart, 0x080D5628 + 1
	.section .text.m4aSongNumStartOrChange, "ax", %progbits
@ m4aSongNumStartOrChange @ JP 0x080D4F20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global m4aSongNumStartOrChange
	.thumb_func
m4aSongNumStartOrChange:
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _080D4F4C @ =0x082140B4
	ldr r1, _080D4F50 @ =0x08214120
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	ldr r3, [r1]
	ldr r2, [r0]
	cmp r3, r2
	beq _080D4F54
	adds r0, r1, #0
	adds r1, r2, #0
	bl MPlayStart
	b _080D4F68
	.align 2, 0
_080D4F4C: .4byte 0x082140B4
_080D4F50: .4byte 0x08214120
_080D4F54:
	ldr r2, [r1, #4]
	ldrh r0, [r1, #4]
	cmp r0, #0
	beq _080D4F60
	cmp r2, #0
	bge _080D4F68
_080D4F60:
	adds r0, r1, #0
	adds r1, r3, #0
	bl MPlayStart
_080D4F68:
	pop {r0}
	bx r0

