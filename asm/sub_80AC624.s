	.syntax unified
	.set memcpy, 0x080D6908 + 1
	.section .text.sub_80AC624, "ax", %progbits
@ sub_80AC624 @ JP 0x080AC624 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AC624
	.thumb_func
sub_80AC624:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _080AC658 @ =0x081F578C
	mov r0, sp
	movs r2, #3
	bl memcpy
	ldr r0, _080AC65C @ =0x0202E4D4
	ldr r0, [r0]
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AC664
	asrs r0, r0, #6
	add r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #5
	ldr r1, _080AC660 @ =0x02020188
	adds r0, r0, r1
	b _080AC666
	.align 2, 0
_080AC658: .4byte 0x081F578C
_080AC65C: .4byte 0x0202E4D4
_080AC660: .4byte 0x02020188
_080AC664:
	ldr r0, _080AC670 @ =0x02020188
_080AC666:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080AC670: .4byte 0x02020188

