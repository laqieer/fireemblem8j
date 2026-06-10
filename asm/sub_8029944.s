	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_80262F8, 0x080262F8 + 1
	.set sub_8035610, 0x08035610 + 1
	.set sub_80507B0, 0x080507B0 + 1
	.section .text.sub_8029944, "ax", %progbits
@ sub_8029944 @ JP 0x08029944 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8029944
	.thumb_func
sub_8029944:
	push {r4, lr}
	bl sub_80262F8
	ldr r0, _08029984 @ =0x0202E4DC
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80194BC
	ldr r0, _08029988 @ =0x085C5898
	bl sub_80507B0
	adds r4, r0, #0
	ldr r0, _0802998C @ =0x000007F6
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8035610
	ldr r0, _08029990 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802997E
	movs r0, #0x6a
	bl m4aSongNumStart
_0802997E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08029984: .4byte 0x0202E4DC
_08029988: .4byte 0x085C5898
_0802998C: .4byte 0x000007F6
_08029990: .4byte 0x0202BCEC

