	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set sub_80B1DD8, 0x080B1DD8 + 1
	.section .text.sub_809AEC0, "ax", %progbits
@ sub_809AEC0 @ JP 0x0809AEC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809AEC0
	.thumb_func
sub_809AEC0:
	push {lr}
	ldr r0, _0809AEDC @ =0x03005270
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809AEE4
	ldr r0, _0809AEE0 @ =sub_809AE40
	bl sub_80B1DD8
	bl Proc_End
	b _0809AEEE
	.align 2, 0
_0809AEDC: .4byte 0x03005270
_0809AEE0: .4byte 0x0809AE41  @ sub_809AE40
_0809AEE4:
	ldr r0, _0809AF08 @ =sub_809AE20
	bl sub_80B1DD8
	bl Proc_End
_0809AEEE:
	ldr r0, _0809AF0C @ =sub_809AE80
	bl sub_80B1DD8
	bl Proc_End
	ldr r0, _0809AF10 @ =sub_809AEA0
	bl sub_80B1DD8
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0809AF08: .4byte 0x0809AE21  @ sub_809AE20
_0809AF0C: .4byte 0x0809AE81  @ sub_809AE80
_0809AF10: .4byte 0x0809AEA1  @ sub_809AEA0

