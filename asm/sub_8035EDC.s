	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_8035EDC, "ax", %progbits
@ sub_8035EDC @ JP 0x08035EDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8035EDC
	.thumb_func
sub_8035EDC:
	push {lr}
	adds r2, r1, #0
	ldr r1, _08035F04 @ =0x03004DF0
	str r0, [r1]
	cmp r2, #0
	beq _08035F10
	ldr r0, _08035F08 @ =0x085C67F8
	adds r1, r2, #0
	bl Proc_StartBlocking
	ldr r0, _08035F0C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08035F18
	movs r0, #0xaa
	bl m4aSongNumStart
	b _08035F18
	.align 2, 0
_08035F04: .4byte 0x03004DF0
_08035F08: .4byte 0x085C67F8
_08035F0C: .4byte 0x0202BCEC
_08035F10:
	ldr r0, _08035F1C @ =0x085C67F8
	movs r1, #3
	bl Proc_StartBlocking
_08035F18:
	pop {r0}
	bx r0
	.align 2, 0
_08035F1C: .4byte 0x085C67F8

