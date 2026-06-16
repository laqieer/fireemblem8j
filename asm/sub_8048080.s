	.syntax unified
	.set BMapVSync_End, 0x080300C4 + 1
	.set EndFaceById, 0x08005660 + 1
	.set Proc_End, 0x08002CBC + 1
	.set Proc_EndEach, 0x08002FC8 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set UnsetBmStLinkArenaFlag, 0x08042E0C + 1
	.set nullsub_2, 0x0804D148 + 1
	.set sub_8089078, 0x08089078 + 1
	.section .text.sub_8048080, "ax", %progbits
@ SioMenu_End @ JP 0x08048080 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SioMenu_End
	.thumb_func
SioMenu_End:
	push {r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	mov r1, sp
	ldr r0, _080480D4 @ =0x080DEEBC
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	bl sub_8089078
	movs r0, #3
	bl EndFaceById
	adds r5, r6, #0
	adds r5, #0x2c
	movs r4, #4
_080480A2:
	ldm r5!, {r0}
	bl Proc_End
	subs r4, #1
	cmp r4, #0
	bge _080480A2
	ldr r1, _080480D8 @ =0x0203DA20
	ldrb r2, [r1]
	adds r0, r2, #0
	cmp r0, #0xff
	bne _080480E0
	bl BMapVSync_End
	bl nullsub_2
	bl UnsetBmStLinkArenaFlag
	ldr r0, _080480DC @ =0x085C2EDC
	bl Proc_EndEach
	adds r0, r6, #0
	bl Proc_End
	b _080480F0
	.align 2, 0
_080480D4: .4byte 0x080DEEBC
_080480D8: .4byte 0x0203DA20
_080480DC: .4byte 0x085C2EDC
_080480E0:
	strb r2, [r1, #1]
	ldrb r0, [r1]
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	adds r1, r6, #0
	bl Proc_StartBlocking
_080480F0:
	add sp, #0x14
	pop {r4, r5, r6}
	pop {r0}
	bx r0

