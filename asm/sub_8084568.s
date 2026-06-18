	.syntax unified
	.section .text.sub_8084568, "ax", %progbits
@ PrepareSineWaveScanlineBuf @ JP 0x08084568 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PrepareSineWaveScanlineBuf
	.thumb_func
PrepareSineWaveScanlineBuf:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r5, r2, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r0, _080845A4 @ =0x080DC15C
	mov ip, r0
	movs r6, #0xff
	asrs r1, r1, #0x10
	movs r2, #0x9f
_08084580:
	adds r0, r1, #0
	ands r0, r6
	lsls r0, r0, #1
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r5, r0
	asrs r0, r0, #0xc
	strh r0, [r4]
	adds r4, #2
	adds r1, r1, r3
	subs r2, #1
	cmp r2, #0
	bge _08084580
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080845A4: .4byte 0x080DC15C

