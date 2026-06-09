	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_801FFB4, "ax", %progbits
@ sub_801FFB4 @ JP 0x0801FFB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801FFB4
	.thumb_func
sub_801FFB4:
	push {lr}
	adds r2, r0, #0
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #0x16
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r1, r2, #0
	adds r1, #0x68
	movs r0, #3
	strh r0, [r1]
	ldr r0, _0801FFE8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801FFE4
	ldr r0, _0801FFEC @ =0x00000316
	bl m4aSongNumStart
_0801FFE4:
	pop {r0}
	bx r0
	.align 2, 0
_0801FFE8: .4byte 0x0202BCEC
_0801FFEC: .4byte 0x00000316

