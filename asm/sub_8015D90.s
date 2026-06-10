	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set StoreAdjustedCameraPositions, 0x08015D3C + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8015D90, "ax", %progbits
@ sub_8015D90 @ JP 0x08015D90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8015D90
	.thumb_func
sub_8015D90:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	add r3, sp, #4
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, sp
	bl StoreAdjustedCameraPositions
	ldr r1, [sp]
	lsls r1, r1, #4
	str r1, [sp]
	ldr r0, [sp, #4]
	lsls r2, r0, #4
	str r2, [sp, #4]
	ldr r3, _08015DD4 @ =0x0202BCAC
	movs r4, #0xc
	ldrsh r0, [r3, r4]
	cmp r1, r0
	bne _08015DC4
	movs r1, #0xe
	ldrsh r0, [r3, r1]
	cmp r2, r0
	beq _08015DD0
_08015DC4:
	ldr r4, _08015DD8 @ =0x085C29C8
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _08015DDC
_08015DD0:
	movs r0, #0
	b _08015E0C
	.align 2, 0
_08015DD4: .4byte 0x0202BCAC
_08015DD8: .4byte 0x085C29C8
_08015DDC:
	cmp r5, #0
	beq _08015DEA
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
	b _08015DF2
_08015DEA:
	adds r0, r4, #0
	movs r1, #3
	bl sub_8002BCC
_08015DF2:
	adds r2, r0, #0
	ldr r1, _08015E14 @ =0x0202BCAC
	ldrh r0, [r1, #0xc]
	strh r0, [r2, #0x30]
	ldrh r0, [r1, #0xe]
	strh r0, [r2, #0x32]
	ldr r0, [sp]
	strh r0, [r2, #0x2c]
	ldr r0, [sp, #4]
	strh r0, [r2, #0x2e]
	strh r6, [r2, #0x34]
	strh r7, [r2, #0x36]
	movs r0, #1
_08015E0C:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08015E14: .4byte 0x0202BCAC

