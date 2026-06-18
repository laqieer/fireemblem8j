	.syntax unified
	.set sub_80D65DC, 0x080D65DC + 1
	.section .text.sub_80D9188, "ax", %progbits
@ _fwalk @ JP 0x080D9188 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _fwalk
	.thumb_func
_fwalk:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	movs r7, #0
	movs r1, #0xec
	lsls r1, r1, #1
	adds r6, r0, r1
	cmp r6, #0
	beq _080D91C0
_080D919C:
	ldr r5, [r6, #8]
	ldr r4, [r6, #4]
	b _080D91B4
_080D91A2:
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _080D91B2
	adds r0, r5, #0
	bl sub_80D65DC
	orrs r7, r0
_080D91B2:
	adds r5, #0x58
_080D91B4:
	subs r4, #1
	cmp r4, #0
	bge _080D91A2
	ldr r6, [r6]
	cmp r6, #0
	bne _080D919C
_080D91C0:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}

