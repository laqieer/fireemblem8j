	.syntax unified
	.set sub_801B668, 0x0801B668 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80194BC, "ax", %progbits
@ sub_80194BC @ JP 0x080194BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80194BC
	.thumb_func
sub_80194BC:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r3, r1, #0
	ldr r0, _08019514 @ =0x0202E4D0
	movs r2, #2
	ldrsh r1, [r0, r2]
	adds r1, #4
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, #2
	adds r4, r1, #0
	muls r4, r0, r4
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _080194E0
	subs r4, #1
_080194E0:
	movs r0, #0xff
	ands r3, r0
	lsls r0, r3, #8
	adds r3, r3, r0
	mov r0, sp
	strh r3, [r0]
	adds r0, r5, #0
	subs r0, #8
	ldr r1, [r0]
	lsrs r2, r4, #0x1f
	adds r2, r4, r2
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	bl sub_80D6370
	adds r0, r5, #0
	bl sub_801B668
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019514: .4byte 0x0202E4D0

