	.syntax unified
	.set BMapDispResume, 0x08030108 + 1
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_80310F4, 0x080310F4 + 1
	.set sub_805B784, 0x0805B784 + 1
	.set sub_805B7CC, 0x0805B7CC + 1
	.set sub_805BBB8, 0x0805BBB8 + 1
	.set sub_807A888, 0x0807A888 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.section .text.sub_80D1F10, "ax", %progbits
@ sub_80D1F10 @ JP 0x080D1F10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D1F10
	.thumb_func
sub_80D1F10:
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	ldr r5, [r1, #0x14]
	ldr r4, [r5, #0x14]
	ldr r6, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #2
	bne _080D1F74
	adds r0, r1, #0
	bl Proc_End
	adds r0, r5, #0
	bl Proc_End
	adds r0, r4, #0
	bl Proc_End
	ldr r0, _080D1F7C @ =0x03005390
	bl sub_805B7CC
	ldr r0, _080D1F80 @ =0x0201FADC
	bl sub_805BBB8
	bl sub_805B784
	ldr r1, _080D1F84 @ =0x0203A954
	movs r0, #0
	strb r0, [r1, #0x11]
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	bl BMapDispResume
	bl sub_80310F4
	bl RefreshEntityBmMaps
	bl sub_8019914
	bl sub_8027144
	bl sub_807B4B8
	ldr r0, _080D1F88 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_807A888
_080D1F74:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D1F7C: .4byte 0x03005390
_080D1F80: .4byte 0x0201FADC
_080D1F84: .4byte 0x0203A954
_080D1F88: .4byte 0x03004DF0

