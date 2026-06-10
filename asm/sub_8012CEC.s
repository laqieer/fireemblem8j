	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8012CEC, "ax", %progbits
@ sub_8012CEC @ JP 0x08012CEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8012CEC
	.thumb_func
sub_8012CEC:
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	lsls r2, r2, #0x18
	asrs r4, r2, #0x18
	ldr r0, _08012D34 @ =0x085BA36C
	bl Proc_Find
	cmp r0, #0
	bne _08012D22
	cmp r4, #1
	bne _08012D1A
	ldr r0, _08012D38 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08012D1A
	ldr r0, _08012D3C @ =0x0000026A
	bl m4aSongNumStart
_08012D1A:
	ldr r0, _08012D34 @ =0x085BA36C
	movs r1, #3
	bl sub_8002BCC
_08012D22:
	adds r1, r0, #0
	adds r1, #0x29
	strb r5, [r1]
	adds r0, #0x2a
	strb r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08012D34: .4byte 0x085BA36C
_08012D38: .4byte 0x0202BCEC
_08012D3C: .4byte 0x0000026A

