	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80498A4, 0x080498A4 + 1
	.section .text.sub_804AAC8, "ax", %progbits
@ sub_804AAC8 @ JP 0x0804AAC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804AAC8
	.thumb_func
sub_804AAC8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804AAF8 @ =0x0203DD8C
	ldrb r2, [r0, #9]
	ldr r0, _0804AAFC @ =0x0203DA20
	adds r0, #0xa0
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	cmp r2, r0
	blt _0804AAEA
	bl sub_80498A4
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_0804AAEA:
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804AAF8: .4byte 0x0203DD8C
_0804AAFC: .4byte 0x0203DA20

