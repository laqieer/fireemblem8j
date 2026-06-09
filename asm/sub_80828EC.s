	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.sub_80828EC, "ax", %progbits
@ sub_80828EC @ JP 0x080828EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80828EC
	.thumb_func
sub_80828EC:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r2, #0
	ldr r3, _08082988 @ =0x08A14B2C
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r3, #4
	adds r2, r2, r3
	ldr r0, _0808298C @ =0x081F5294
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #5
	ldr r1, _08082990 @ =0x020228A8
	movs r3, #0x1f
	mov r8, r3
	movs r6, #0x1f
	adds r5, r0, r1
	ldr r4, [r2]
	movs r0, #0xf
	mov ip, r0
_08082918:
	ldrh r1, [r4]
	adds r3, r1, #0
	adds r2, r1, #0
	ands r2, r6
	subs r0, r6, r2
	muls r0, r7, r0
	cmp r0, #0
	bge _0808292A
	adds r0, #0x1f
_0808292A:
	asrs r0, r0, #5
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsrs r1, r1, #5
	mov r0, r8
	ands r1, r0
	subs r0, r6, r1
	muls r0, r7, r0
	cmp r0, #0
	bge _08082942
	adds r0, #0x1f
_08082942:
	asrs r0, r0, #5
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsrs r3, r3, #0xa
	mov r0, r8
	ands r3, r0
	subs r0, r6, r3
	muls r0, r7, r0
	cmp r0, #0
	bge _0808295A
	adds r0, #0x1f
_0808295A:
	asrs r0, r0, #5
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsls r1, r1, #5
	orrs r2, r1
	lsrs r0, r0, #6
	orrs r2, r0
	strh r2, [r5]
	adds r5, #2
	adds r4, #2
	movs r3, #1
	rsbs r3, r3, #0
	add ip, r3
	mov r0, ip
	cmp r0, #0
	bge _08082918
	bl sub_8001EE4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082988: .4byte 0x08A14B2C
_0808298C: .4byte 0x081F5294
_08082990: .4byte 0x020228A8

