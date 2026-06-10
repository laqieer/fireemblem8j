	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_801C7D8, 0x0801C7D8 + 1
	.section .text.sub_801C8E4, "ax", %progbits
@ sub_801C8E4 @ JP 0x0801C8E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801C8E4
	.thumb_func
sub_801C8E4:
	push {lr}
	ldr r0, _0801C910 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801C8F8
	movs r0, #0x68
	bl m4aSongNumStart
_0801C8F8:
	ldr r2, _0801C914 @ =0x0202BCAC
	ldrb r1, [r2, #4]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r2, #4]
	ldr r0, _0801C918 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_801C7D8
	pop {r0}
	bx r0
	.align 2, 0
_0801C910: .4byte 0x0202BCEC
_0801C914: .4byte 0x0202BCAC
_0801C918: .4byte 0x03004DF0

