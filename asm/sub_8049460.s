	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set DrawUiFrame, 0x0804EF40 + 1
	.set Proc_EndEach, 0x08002FC8 + 1
	.set sub_80156F0, 0x080156F0 + 1
	.set sub_804944C, 0x0804944C + 1
	.set sub_804F8E0, 0x0804F8E0 + 1
	.set sub_80B5224, 0x080B5224 + 1
	.section .text.sub_8049460, "ax", %progbits
@ sub_8049460 @ JP 0x08049460 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8049460
	.thumb_func
sub_8049460:
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl sub_80156F0
	adds r0, r4, #0
	bl sub_80B5224
	ldr r0, _080494A8 @ =0x085D3EA8
	bl Proc_EndEach
	adds r0, r4, #0
	bl sub_804944C
	str r0, [r4, #0x54]
	bl sub_804F8E0
	ldr r0, _080494AC @ =0x020234A8
	movs r1, #4
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r1, #0x12
	movs r2, #0x10
	movs r3, #0xb
	bl DrawUiFrame
	movs r0, #0xf
	bl BG_EnableSyncByMask
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080494A8: .4byte 0x085D3EA8
_080494AC: .4byte 0x020234A8

