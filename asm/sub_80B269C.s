	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B269C, "ax", %progbits
@ sub_80B269C @ JP 0x080B269C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B269C
	.thumb_func
sub_80B269C:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	mov r8, r3
	ldr r0, _080B26DC @ =0x08A9DCD4
	bl Proc_Find
	lsls r4, r4, #3
	adds r0, r0, r4
	adds r2, r0, #0
	adds r2, #0x2c
	movs r1, #1
	strb r1, [r2]
	ldr r2, _080B26E0 @ =0x000001FF
	adds r1, r2, #0
	ands r5, r1
	strh r5, [r0, #0x2e]
	movs r1, #0xff
	ands r6, r1
	strh r6, [r0, #0x30]
	adds r0, #0x2d
	mov r1, r8
	strb r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B26DC: .4byte 0x08A9DCD4
_080B26E0: .4byte 0x000001FF

