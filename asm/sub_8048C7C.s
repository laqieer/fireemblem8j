	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8042720, 0x08042720 + 1
	.set sub_808B1F4, 0x0808B1F4 + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.section .text.sub_8048C7C, "ax", %progbits
@ sub_8048C7C @ JP 0x08048C7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8048C7C
	.thumb_func
sub_8048C7C:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, _08048CB8 @ =0x02000C04
	ldr r2, _08048CBC @ =sub_8048C68
	adds r0, r5, #0
	mov r1, sp
	bl sub_8042720
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08048CCE
	ldrb r0, [r5, #4]
	cmp r0, #0
	bne _08048CC4
	ldr r0, _08048CC0 @ =0x06015000
	movs r1, #6
	bl sub_808BB14
	movs r0, #0x38
	movs r1, #0x38
	movs r2, #0x69
	bl sub_808B1F4
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
	b _08048CCE
	.align 2, 0
_08048CB8: .4byte 0x02000C04
_08048CBC: .4byte 0x08048C69  @ sub_8048C68
_08048CC0: .4byte 0x06015000
_08048CC4:
	movs r0, #0
	str r0, [r4, #0x58]
	adds r0, r4, #0
	bl sub_8002DE4
_08048CCE:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

