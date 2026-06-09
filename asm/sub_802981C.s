	.syntax unified
	.set NewTargetSelection_Specialized, 0x08050818 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_8026238, 0x08026238 + 1
	.set sub_8035610, 0x08035610 + 1
	.section .text.sub_802981C, "ax", %progbits
@ sub_802981C @ JP 0x0802981C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802981C
	.thumb_func
sub_802981C:
	push {r4, lr}
	bl sub_8026238
	ldr r0, _08029860 @ =0x0202E4DC
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80194BC
	ldr r0, _08029864 @ =0x085C57D8
	ldr r1, _08029868 @ =sub_80297F4
	bl NewTargetSelection_Specialized
	adds r4, r0, #0
	ldr r0, _0802986C @ =0x000007F3
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8035610
	ldr r0, _08029870 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08029858
	movs r0, #0x6a
	bl m4aSongNumStart
_08029858:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08029860: .4byte 0x0202E4DC
_08029864: .4byte 0x085C57D8
_08029868: .4byte 0x080297F5  @ sub_80297F4
_0802986C: .4byte 0x000007F3
_08029870: .4byte 0x0202BCEC

