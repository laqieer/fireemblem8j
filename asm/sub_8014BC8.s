	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_8014BC8, "ax", %progbits
@ sub_8014BC8 @ JP 0x08014BC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8014BC8
	.thumb_func
sub_8014BC8:
	push {lr}
	adds r1, r0, #0
	ldr r0, _08014BE4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08014BE0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
_08014BE0:
	pop {r0}
	bx r0
	.align 2, 0
_08014BE4: .4byte 0x0202BCEC

