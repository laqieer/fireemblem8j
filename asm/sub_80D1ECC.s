	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set sub_805B784, 0x0805B784 + 1
	.set sub_805B7CC, 0x0805B7CC + 1
	.set sub_805BBB8, 0x0805BBB8 + 1
	.section .text.sub_80D1ECC, "ax", %progbits
@ sub_80D1ECC @ JP 0x080D1ECC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D1ECC
	.thumb_func
sub_80D1ECC:
	push {r4, r5, lr}
	ldr r4, [r0, #0x14]
	ldr r5, [r4, #0x14]
	adds r1, r5, #0
	adds r1, #0x31
	ldrb r1, [r1]
	cmp r1, #0
	beq _080D1F00
	cmp r1, #1
	bne _080D1F00
	bl Proc_End
	adds r0, r4, #0
	bl Proc_End
	adds r0, r5, #0
	bl Proc_End
	ldr r0, _080D1F08 @ =0x03005390
	bl sub_805B7CC
	ldr r0, _080D1F0C @ =0x0201FADC
	bl sub_805BBB8
	bl sub_805B784
_080D1F00:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D1F08: .4byte 0x03005390
_080D1F0C: .4byte 0x0201FADC

