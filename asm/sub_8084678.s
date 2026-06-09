	.syntax unified
	.section .text.sub_8084678, "ax", %progbits
@ sub_8084678 @ JP 0x08084678 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8084678
	.thumb_func
sub_8084678:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r7, [sp, #0x1c]
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	lsls r2, r2, #0x10
	asrs r6, r2, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r1, [sp, #0x18]
	cmp r1, r7
	bge _080846C2
	ldr r0, _080846CC @ =0x080DC15C
	mov r8, r0
	movs r0, #0xff
	mov ip, r0
	adds r0, r1, #0
	muls r0, r3, r0
	adds r2, r0, r5
	subs r1, r7, r1
_080846A4:
	adds r0, r2, #0
	mov r5, ip
	ands r0, r5
	lsls r0, r0, #1
	add r0, r8
	movs r5, #0
	ldrsh r0, [r0, r5]
	muls r0, r6, r0
	asrs r0, r0, #0xc
	strh r0, [r4]
	adds r4, #2
	adds r2, r2, r3
	subs r1, #1
	cmp r1, #0
	bne _080846A4
_080846C2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080846CC: .4byte 0x080DC15C

