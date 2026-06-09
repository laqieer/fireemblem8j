	.syntax unified
	.set BMapDispResume, 0x08030108 + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_80310F4, 0x080310F4 + 1
	.set sub_807A888, 0x0807A888 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.section .text.sub_80D231C, "ax", %progbits
@ sub_80D231C @ JP 0x080D231C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D231C
	.thumb_func
sub_80D231C:
	push {lr}
	bl BMapDispResume
	bl sub_80310F4
	bl RefreshEntityBmMaps
	bl sub_807B4B8
	ldr r0, _080D2344 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_807A888
	bl sub_8019914
	bl sub_8027144
	pop {r0}
	bx r0
	.align 2, 0
_080D2344: .4byte 0x03004DF0

