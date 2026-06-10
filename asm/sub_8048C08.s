	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8042720, 0x08042720 + 1
	.set sub_808B1F4, 0x0808B1F4 + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.section .text.sub_8048C08, "ax", %progbits
@ sub_8048C08 @ JP 0x08048C08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8048C08
	.thumb_func
sub_8048C08:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _08048C30 @ =0x02000C00
	ldr r2, _08048C34 @ =sub_8048BF0
	adds r0, r4, #0
	mov r1, sp
	bl sub_8042720
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08048C5A
	ldrb r0, [r4]
	cmp r0, #0
	bne _08048C38
	adds r0, r5, #0
	bl sub_8002DE4
	b _08048C5A
	.align 2, 0
_08048C30: .4byte 0x02000C00
_08048C34: .4byte 0x08048BF1  @ sub_8048BF0
_08048C38:
	cmp r0, #0
	blt _08048C5A
	cmp r0, #2
	bgt _08048C5A
	ldr r0, _08048C64 @ =0x06015000
	movs r1, #6
	bl sub_808BB14
	movs r0, #0x38
	movs r1, #0x38
	movs r2, #0x68
	bl sub_808B1F4
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
_08048C5A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08048C64: .4byte 0x06015000

