	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_80707BC, "ax", %progbits
@ sub_80707BC @ JP 0x080707BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80707BC
	.thumb_func
sub_80707BC:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	ldr r0, _0807082C @ =0x0201FDB8
	ldr r0, [r0]
	ldr r4, _08070830 @ =0x0201FDC4
	cmp r0, #0
	bne _080707D0
	ldr r4, _08070834 @ =0x0201FF04
_080707D0:
	movs r3, #0
	ldr r0, [r2, #0x44]
	mov ip, r0
	ldr r1, _08070838 @ =0x080DC15C
	mov r8, r1
	movs r6, #0xff
	ldr r5, [r2, #0x48]
_080707DE:
	lsls r0, r3, #1
	movs r7, #0x2e
	ldrsh r1, [r2, r7]
	adds r0, r0, r1
	ands r0, r6
	lsls r0, r0, #1
	add r0, r8
	movs r1, #0
	ldrsh r0, [r0, r1]
	asrs r0, r0, #9
	adds r0, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	muls r0, r5, r0
	asrs r0, r0, #8
	strh r0, [r4]
	adds r4, #2
	adds r3, #1
	cmp r3, #0x4f
	bls _080707DE
	ldrh r0, [r2, #0x2e]
	adds r0, #2
	strh r0, [r2, #0x2e]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, ip
	bne _08070820
	adds r0, r2, #0
	bl Proc_End
_08070820:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807082C: .4byte 0x0201FDB8
_08070830: .4byte 0x0201FDC4
_08070834: .4byte 0x0201FF04
_08070838: .4byte 0x080DC15C

