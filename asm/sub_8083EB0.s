	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_807FDEC, 0x0807FDEC + 1
	.section .text.sub_8083EB0, "ax", %progbits
@ sub_8083EB0 @ JP 0x08083EB0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8083EB0
	.thumb_func
sub_8083EB0:
	push {lr}
	ldr r0, _08083F00 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08083EC4
	movs r0, #0xb4
	bl m4aSongNumStart
_08083EC4:
	ldr r3, _08083F04 @ =0x0203E1EC
	ldr r1, _08083F08 @ =0x0203A568
	adds r0, r1, #0
	adds r0, #0x73
	ldrb r2, [r0]
	adds r0, r3, #0
	adds r0, #0x60
	strb r2, [r0]
	adds r1, #0x74
	ldrb r0, [r1]
	adds r1, r3, #0
	adds r1, #0x61
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	bl sub_807FDEC
	pop {r0}
	bx r0
	.align 2, 0
_08083F00: .4byte 0x0202BCEC
_08083F04: .4byte 0x0203E1EC
_08083F08: .4byte 0x0203A568

