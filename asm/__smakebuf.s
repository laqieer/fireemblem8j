	.syntax unified
	.set _fstat_r, 0x080DA8EC + 1
	.set _malloc_r, 0x080D946C + 1
	.set sub_80DA938, 0x080DA938 + 1
	.section .text.__smakebuf, "ax", %progbits
@ __smakebuf @ JP 0x080D9234 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global __smakebuf
	.thumb_func
__smakebuf:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	adds r4, r0, #0
	movs r0, #2
	ldrh r1, [r4, #0xc]
	ands r0, r1
	cmp r0, #0
	bne _080D92CA
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r0, #0
	blt _080D925C
	ldr r0, [r4, #0x54]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	mov r2, sp
	bl _fstat_r
	cmp r0, #0
	bge _080D926E
_080D925C:
	movs r7, #0
	movs r6, #0x80
	lsls r6, r6, #3
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r1, #0
	ldrh r2, [r4, #0xc]
	orrs r0, r2
	b _080D92B2
_080D926E:
	movs r7, #0
	ldr r1, [sp, #4]
	movs r0, #0xf0
	lsls r0, r0, #8
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r1, r0
	bne _080D9282
	movs r7, #1
_080D9282:
	movs r6, #0x80
	lsls r6, r6, #3
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	bne _080D92A8
	ldr r1, [r4, #0x28]
	ldr r0, _080D92A4 @ =__sseek
	cmp r1, r0
	bne _080D92A8
	adds r0, r6, #0
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
	str r6, [r4, #0x4c]
	b _080D92B4
	.align 2, 0
_080D92A4: .4byte 0x080DA31D  @ __sseek
_080D92A8:
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	ldrh r1, [r4, #0xc]
	orrs r0, r1
_080D92B2:
	strh r0, [r4, #0xc]
_080D92B4:
	ldr r0, [r4, #0x54]
	adds r1, r6, #0
	bl _malloc_r
	adds r2, r0, #0
	cmp r2, #0
	bne _080D92D8
	movs r0, #2
	ldrh r2, [r4, #0xc]
	orrs r0, r2
	strh r0, [r4, #0xc]
_080D92CA:
	adds r0, r4, #0
	adds r0, #0x43
	str r0, [r4]
	str r0, [r4, #0x10]
	movs r0, #1
	str r0, [r4, #0x14]
	b _080D9306
_080D92D8:
	ldr r1, [r4, #0x54]
	ldr r0, _080D930C @ =_cleanup_r
	str r0, [r1, #0x3c]
	movs r0, #0x80
	movs r5, #0
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
	str r2, [r4]
	str r2, [r4, #0x10]
	str r6, [r4, #0x14]
	cmp r7, #0
	beq _080D9306
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	bl sub_80DA938
	cmp r0, #0
	beq _080D9306
	movs r0, #1
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
_080D9306:
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D930C: .4byte 0x080D8C5D  @ _cleanup_r

