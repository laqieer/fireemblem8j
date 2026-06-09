	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_807BB9C, "ax", %progbits
@ sub_807BB9C @ JP 0x0807BB9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807BB9C
	.thumb_func
sub_807BB9C:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x3f
	movs r5, #0
	movs r0, #7
	strb r0, [r1]
	ldr r0, _0807BBE0 @ =0x08A13370
	adds r1, r4, #0
	bl sub_8002BCC
	str r4, [r0, #0x54]
	adds r2, r0, #0
	adds r2, #0x64
	movs r1, #0x40
	strh r1, [r2]
	adds r0, #0x66
	strh r5, [r0]
	ldr r0, [r4, #0x30]
	strh r5, [r0, #0x18]
	ldr r0, [r4, #0x30]
	strh r5, [r0, #0x1a]
	ldr r0, _0807BBE4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807BBDA
	movs r0, #0xd6
	bl m4aSongNumStart
_0807BBDA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807BBE0: .4byte 0x08A13370
_0807BBE4: .4byte 0x0202BCEC

